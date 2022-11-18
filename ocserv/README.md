You can Bring up OCserver by :

```
docker-compose up -d 
```

# Add user
    
```
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd testUserName
```
# Change user password
```
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd testUserName
```
# Delete user
```
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -d testUserName
```
# Lock user
```
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -l testUserName
```
# Unlock user
```
docker exec -ti ocserv ocpasswd -c /etc/ocserv/ocpasswd -u testUserName
```
# Show all users and their hashed password
```
docker exec -ti ocserv cat /etc/ocserv/ocpasswd
```
