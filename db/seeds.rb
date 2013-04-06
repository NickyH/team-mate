User.delete_all
Team.delete_all
Game.delete_all
Competition.delete_all
Attendee.delete_all

u1 = User.create(name: 'nicky', email: 'nickyhughes00@gmail.com', phone: '+13476091301', gender: 'female', positions: 'GA, GS', password: 'a', password_confirmation: 'a', current_team: 'Bubblebees')
u2 = User.create(name: 'mandy', email: 'mandy@gmail.com', phone: '', gender: 'female', positions: 'GA, GS', password: 'a', password_confirmation: 'a', current_team: 'Bubblebees')
u3 = User.create(name: 'chris', email: 'chris@gmail.com', phone: '', gender: 'female', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'chris.JPG', current_team: 'Bubblebees')
u4 = User.create(name: 'jane', email: 'jane@gmail.com', phone: '', gender: 'f', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'jane.JPG', current_team: 'Bubblebees')
u5 = User.create(name: 'gemma', email: 'gemma@gmail.com', phone: '', gender: 'f', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'gemma.JPG', current_team: 'Bubblebees')
u6 = User.create(name: 'kate', email: 'kate@gmail.com', phone: '', gender: 'f', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'kate.JPG', current_team: 'Bubblebees')
u7 = User.create(name: 'rachael', email: 'rachael@gmail.com', phone: '', gender: 'f', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'rachael.JPG', current_team: 'Bubblebees')
u8 = User.create(name: 'sophie', email: 'sophie@gmail.com', phone: '', gender: 'f', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'sophie.JPG', current_team: 'Bubblebees')
u9 = User.create(name: 'jess', email: 'jess@gmail.com', phone: '', gender: 'f', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'jess.JPG', current_team: 'Bubblebees')


t1 = Team.create(team_name: 'Bubblebees', sport: 'netball', timezone: 'EST', team_gender: 'female', manager: 'chris')
t2 = Team.create(team_name: 'Singapore Slings', sport: 'basketball', timezone: 'EST', team_gender: 'female', manager: 'chris')

c1 = Competition.create(name: 'Spring 2013', start_date: '2013-03-30', duration: '12')

g1 = Game.create(time: '7.15pm', date: '2013-03-24', opponent: 'Guinness Girls', location: '1 Reuss Street, Glebe, Sydney')
g2 = Game.create(time: '7.15pm', date: 'Sunday 31st March 2013', opponent: 'Hooplahs', location: '1 Reuss Street, Glebe, Sydney')
g3 = Game.create(time: '7.15pm', date: 'Sunday 7th April 2013', opponent: 'Jackpots', location: '1 Reuss Street, Glebe, Sydney')
g4 = Game.create(time: '7.15pm', date: 'Sunday 14th April 2013', opponent: 'Hotshots', location: '1 Reuss Street, Glebe, Sydney')
g5 = Game.create(time: '7.15pm', date: 'Sunday 21st April 2013', opponent: 'Pilates World Champions', location: '1 Reuss Street, Glebe, Sydney')
g6 = Game.create(time: '7.15pm', date: 'Sunday 28th April 2013', opponent: 'Unbeatables', location: '1 Reuss Street, Glebe, Sydney')


u3.teams = [t1, t2]


u1.is_admin = true
u3.is_manager = true

t1.users << u3 << u4 << u5 << u6 << u7 << u8 << u9
t2.users << u4 << u5 << u6

c1.games << g1 << g2 << g3 << g4 << g5 << g6
t1.games << g1 << g2 << g3 << g4 << g5 << g6