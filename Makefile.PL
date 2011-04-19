
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Plack-based framework for RESTful web applications',
  'AUTHOR' => 'Ido Perlmuter <ido@ido50.net>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Leyland',
  'EXE_FILES' => [
    'bin/leyland'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'Leyland',
  'PREREQ_PM' => {
    'App::Cmd::Setup' => '0',
    'Carp' => '0',
    'Cwd' => '0',
    'Data::Dumper' => '0',
    'Devel::Declare::Interface' => '0',
    'Devel::Declare::Parser' => '0',
    'Encode' => '0',
    'Exporter::Declare' => '0',
    'File::Path' => '0',
    'JSON::Any' => '0',
    'Locale::Wolowitz' => '0',
    'Log::Dispatch' => '0',
    'Log::Handler' => '0',
    'Module::Load' => '0',
    'Moose' => '0',
    'Moose::Role' => '0',
    'MooseX::ClassAttribute' => '0',
    'MooseX::NonMoose' => '0',
    'Plack::Request' => '0',
    'Tenjin' => '0.070001',
    'Text::SpanningTable' => '0',
    'Throwable' => '0',
    'Tie::IxHash' => '0',
    'Try::Tiny' => '0',
    'XML::TreePP' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



