package AudioFile::Info::Build;

use strict;
use warnings;

use base 'Module::Build';

use YAML qw(LoadFile DumpFile);

sub ACTION_install {
  my $self = shift;

  $self->SUPER::ACTION_install(@_);

  require AudioFile::Info;

  die "Can't find the installation of AudioFile::Info\n" if $@;

  my $pkg = $self->notes('package');

  my $path = $INC{'AudioFile/Info.pm'};

  $path =~ s/Info.pm$/plugins.yaml/;

  my $config;

  if (-f $path) {
    $config = LoadFile($path);
  }

  $config->{$pkg} = $self->notes('config');

  # calculate "usefulness" score

  my ($mp3, $ogg);

  for (qw(read write)) {
    $mp3 += 50 if $config->{$pkg}{"${_}_mp3"};
  }

  for (qw(read write)) {
    $ogg +=50 if $config->{$pkg}{"${_}_ogg"};
  }

  # prefer non-perl implementations
  unless ($config->{$pkg}{pure_perl}) {
    $mp3 += 10 if $mp3;
    $ogg += 10 if $ogg;
  }

  # if no default set and this plugin has a score, or if this plugin
  # score higher than the existing default, then set default
  if (! exists $config->{default}{mp3} and $mp3
     or $mp3 and $mp3 >= $config->{default}{mp3}{score}) {
    $config->{default}{mp3} = { name => $pkg, score => $mp3 };
    warn "AudioFile::Info - Default mp3 handler is now $pkg\n";
  }

  if (! exists $config->{default}{ogg} and $ogg
     or $ogg and $ogg >= $config->{default}{ogg}{score}) {
    $config->{default}{ogg} = { name => $pkg, score => $ogg };
    warn "AudioFile::Info - Default ogg handler is now $pkg\n";
  }

  DumpFile($path, $config);
}

1;