#
# LsL/DB.pm
#
# Copyright (C) 2004 jack Klein, Inc. All Rights Reserved
#
# $Id: DB.pm 907 2006-05-19 17:39:37Z bill $
#

package LsL::DB;

use strict;
use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK );
use Carp;
use Exporter;
use HTML::Mason::Exceptions ( abbr => [ qw(system_error) ] );

# public (exported) variables
$VERSION   = 0.01;
@ISA       = qw(Exporter);
@EXPORT    = qw( sdbi );
@EXPORT_OK = qw();

# private (non-exported) variables
my $_sdbi = undef;

# public class methods

# returns the global Data::Shark::DBI object
sub sdbi {
  return $_sdbi if $_sdbi;

  # create new object
  my $host   = $LsL::DB_HOST;
  my $sid    = $LsL::DB_SID;
  #my $source = "dbi:Oracle:host=$host;sid=$sid;";
  my $source = "DBI:mysql:database=$sid;host=$host:port=3306";
  #my $source = "dbi:Oracle:$sid";

  $_sdbi = new Data::Shark::DBI( $source, $LsL::DB_USER, $LsL::DB_AUTH,
                              $LsL::DB_ATTR );

  # check for logging config option
  if ($LsL::Config::DIO_LOGGING) {
    $_sdbi->db_log(\&LsL::DB::_my_log) if $_sdbi;
  }

  unless ( $_sdbi ) {
    carp "Unable to connect to database ($host - $sid): $DBI::errstr";
    system_error "Unable to connect to database ($host - $sid): $DBI::errstr";
    return undef;
  } else {
    return $_sdbi;
  }
}

# private class methods
sub _my_log {
  my ($data) = @_;
  open LFILE,'>> /tmp/wlog.sql' or return;
  print LFILE $data, "\n";
  close LFILE;
}

1;
