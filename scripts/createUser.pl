#!/usr/bin/env perl
#A little perl script to demonstrate user creation with the jumpcloud API

#NOTE: Security risk: Don't do this in production, i.e don't keep the secret key
#in the script!
my $JUMPCLOUD_API_KEY="your-api-key";

#Users file is a formatted document with the users details in it (csv format)
my $users_file="users.csv";

#initialise user parameters
my $userName="twelcome";
my $email="traiano\@gmail.com";
my $firstName="Traiano";
my $lastName="Welcome";

#read data from the users file into an array
#NOTE; we can do more validation here, and more error handling
open my $handle, '<', $users_file;
chomp(my @lines = <$handle>);
close $handle;

foreach my $line (@lines){

 my @user_lines=split(",",$line);

 $userName=@user_lines[0];
 $email=@user_lines[1];
 $firstName=@user_lines[2];
 $lastName=@user_lines[3];

 print "debug) user name ($userName) email ($email) first name ($firstName) last name ($lastName)\n";

 create_user($userName,$email,$firstName,$lastName);

}

sub create_user{

	my $userName=shift;
	my $email=shift;
	my $firstName=shift;
	my $lastName=shift;

	my $create_cmd="curl -X POST https://console.jumpcloud.com/api/systemusers -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'x-api-key: $JUMPCLOUD_API_KEY' -d '{
	\"username\":\"$userName\",
	\"email\":\"$email\",
	\"firstname\":\"$firstName\",
	\"lastname\":\"$lastName\"
}'";
	#run the create command
	run_command($create_cmd);
}

sub run_command{
	my $cmd=shift;
	open(CMD,"$cmd|") or die "cannot run user creation command: $cmd";
	while(<CMD>){
		chomp($_);
		print "$_\n";	
	}
	close(CMD);
}
