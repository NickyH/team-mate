User.delete_all
Team.delete_all
Game.delete_all
Competition.delete_all

u1 = User.create(name: 'nicky', email: 'nickyhughes00@gmail.com', phone: '+13476091301', gender: 'female', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'cheesecake1.jpeg')
u2 = User.create(name: 'mandy', email: 'mandy@gmail.com', phone: '', gender: 'female', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'cheesecake1.jpeg')
u3 = User.create(name: 'chris', email: 'chris@gmail.com', phone: '', gender: 'female', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'chris.JPG')
u4 = User.create(name: 'jane', email: 'jane@gmail.com', phone: '', gender: 'f', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'jane.JPG')
u5 = User.create(name: 'gemma', email: 'gemma@gmail.com', phone: '', gender: 'f', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'gemma.JPG')
u6 = User.create(name: 'kate', email: 'kate@gmail.com', phone: '', gender: 'f', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'kate.JPG')
u7 = User.create(name: 'rachael', email: 'rachael@gmail.com', phone: '', gender: 'f', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'rachael.JPG')
u8 = User.create(name: 'sophie', email: 'sophie@gmail.com', phone: '', gender: 'f', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'sophie.JPG')
u9 = User.create(name: 'jess', email: 'jess@gmail.com', phone: '', gender: 'f', other_teams: '', positions: 'GA, GS', password: 'a', password_confirmation: 'a', image: 'jess.JPG')


t1 = Team.create(team_name: 'Bubblebees', sport: 'netball', timezone: 'EST', team_gender: 'female', manager: 'chris')
t2 = Team.create(team_name: 'Singapore Slings', sport: 'basketball', timezone: 'EST', team_gender: 'female', manager: 'chris')

c1 = Competition.create(name: 'Spring 2013', start_date: '2013-03-30', duration: '12')

g1 = Game.create(time: '7.15pm', date: '2013-03-24', opponent: 'Guinness Girls', location: 'Sydney')
g2 = Game.create(time: '7.15pm', date: 'Sunday 31st March 2013', opponent: 'Hooplahs', location: 'Sydney')
g3 = Game.create(time: '7.15pm', date: 'Sunday 7th April 2013', opponent: 'Jackpots', location: 'Sydney')
g4 = Game.create(time: '7.15pm', date: 'Sunday 14th April 2013', opponent: 'Hotshots', location: 'Sydney')
g5 = Game.create(time: '7.15pm', date: 'Sunday 21st April 2013', opponent: 'Pilates World Champions', location: 'Sydney')
g6 = Game.create(time: '7.15pm', date: 'Sunday 28th April 2013', opponent: 'Unbeatables', location: 'Sydney')


u3.teams = [t1, t2]


u1.is_admin = true
u2.is_manager = true

t1.users << u3 << u4 << u5 << u6 << u7 << u8 << u9
t2.users << u4 << u5 << u6

c1.games << g1 << g2 << g3 << g4 << g5 << g6