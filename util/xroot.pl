#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use POSIX qw(strftime);

# Gets averages for CPU and MEM along with datetime and network info

my $format = "%Y-%m-%d %a %H:%M";  # date-time format
my $interface = "wlp7s0";          # wifi interface

my ($prev_total, $prev_load) = qw/1 1/;
binmode(STDOUT, "encoding(UTF-8)");

sub cpu() {
    open(STAT, "</proc/stat") or warn 'Failed to open /proc/stat';
    my @info = (split /\s+/,<STAT>)[1..4];
    close(STAT);

    my $total = 0; foreach my $elem (@info) { $total += $elem; }
    my $load = 0;  foreach my $elem (@info[0..2]) { $load += $elem; }

    my ($avg_total, $avg_load) = ($total - $prev_total, $load - $prev_load);
    if ($avg_total == 0) { $avg_total = 1; }

    ($prev_total, $prev_load) = ($total, $load);

    100.0*$avg_load/$avg_total;
}

sub mem() {
    my @mem = (split /\s+/,qx{free -m | grep Mem})[1..2];
    100.0*$mem[1]/$mem[0]
}

sub now() {
    strftime $format, localtime
}

sub net() {
    my $wifi = qx{iwgetid $interface --raw}; chomp $wifi;
    if (!$wifi) { return "󰖪"; }

    open(SIG,"</proc/net/wireless") or warn 'Failed to open /proc/net/wireless';
    my $signal = (split /\s+/,(grep /$interface/,<SIG>)[0])[2]; chop $signal;
    close(SIG);

    $signal = 100*$signal/70;

    my $icon = $signal > 30 ? "" : "󰤠";
    sprintf("%s %s %d%%", $wifi, $icon, $signal);
}

# init values
cpu();

while (1) {
    sleep 1;

    my ($cpu, $mem) = (cpu(), mem());

    sleep 1;

    $cpu += cpu();
    $mem += mem();

    my $now = now();
    my $net = net();

    my $ROOT  = sprintf("%s | CPU %4.1f%% | MEM %4.1f%% | %s",
        $net,
        $cpu/2,
        $mem/2,
        $now
    );

    qx{xsetroot -name "$ROOT"}
}
