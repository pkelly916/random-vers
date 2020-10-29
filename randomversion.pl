use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '1.00';
%IRSSI = (
	authors		=> 'pilot',
	contact		=> 'pilot',
	name		=> 'Random CTCP Version',
	description	=> 'This script will ' .
			   'autoupdate the ctcp ' .
			   'version reply after ' .
			   'each request.',
	license		=> 'GNU General Public License'
);

my @versions = ();
my $versions_file = "versions.txt";
my $irssidir = Irssi::get_irssi_dir();

Irssi::theme_register([
	'modified', '%R>>%n CTCP version changed to %_$0%_.',
	'loaded', '%R>>%n Loaded $0',
	'changed', '%R>>%n CTCP version changed'
]);

sub modversion {
	my ($server, $data, $nick, $address, $target) = @_;
	my $vers = $versions[rand @versions];
	$vers =~ s/\s+$//;
	Irssi::settings_set_str('ctcp_version_reply', $vers);

	Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'changed');
}

sub load_versions {
	my ($file) = @_;

	@versions = ();

	if (-e $file) {
		local *F;
		open(F, "<", $file);
		while (<F>) {
			chomp;
			push(@versions, $_);
		}
		close(F);
	}
}

load_versions("$irssidir/$versions_file");

Irssi::signal_add_last('ctcp msg version', 'modversion');
Irssi::printformat(MSGLEVEL_CLIENTCRAP, 'loaded', $IRSSI{name});
