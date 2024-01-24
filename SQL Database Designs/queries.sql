select * from user_profile;
select * from user_posts;
select * from friendship;
select * from post_comment;
select * from post_like;

-- Display user_profile and their friends
Select up1.given_name as user_profile, up2.given_name as friend 
from user_profile up1
Join friendship
on friendship.profile_accept = up1.id and friendship.status='accepted'
Join user_profile up2
on friendship.profile_request = up2.id
order by up1.given_name;    