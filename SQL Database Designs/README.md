# Social Media App Database

## Install PostgreSQL on Ubuntu

### Step 1: Update Package Lists

Ensure your package lists are up to date before installing PostgreSQL:

```bash
sudo apt update
```
### Step 2: Install PostgreSQL
Use the following command to install PostgreSQL:
```bash
sudo apt install postgresql
```
### Step 3: Verify Installation
Check the status of the PostgreSQL service to confirm it's running:

Verify the installed version of PostgreSQL:
```bash
sudo -u postgres psql -c "SELECT version();"
```
### Step 4: Access PostgreSQL
Access the PostgreSQL prompt to interact with the database:
```bash
sudo -i -u postgres
psql
```

# Basic Features
1. Sign up and create a profile
2. Add other profiles as friends
3. Add posts that contains text, photos, or videos
4. See posts that friends have added (Feed page)
5. Like and add comment to posts others have added

## 1. Sign up and create a profile
Table: user_profile
- id
- email_address
- password
- country
- date_of_birth
- given_name
- surname

## 2. Add other profiles as friends
Friendship = relationship between two profiles

Table 2: friendship
- FK: profile_request
- FK: profile_accept

## 3. Add posts that contains text, photos, or videos
Table: user_posts
- PK: id
- FK: profile_id
- written_text
- media_location
- created_date
- updated_date

## 4. See posts that friends have added (Feed page)
Likely built into the application - No DB Changes required

## 5. Like and add comment to posts others have added
Table: post_like
- PK: id
- FK: post_id
- FK: profile_id
- created_datetime

Table: post_comment
- PK: id
- FK: post_id
- FK: profile_id
- comment_text
- created_datetime

# ER Diagram - Basic Schema Design
![Social Media DB Design](https://github.com/hsmgowtham/Social-Media-App-Database/assets/123358865/095d1b63-f537-4354-a77c-c27c2a22f842)


 
