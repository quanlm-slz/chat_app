# README

Simple template for project use user authentication
## Credentials property
```yaml
secret_key_base: secret_key_base
jwt_secret_key: jwt_secret_key

db:
    host: db
    port: 5432
    username: postgres
    password: password
```
## Functional routes
- post /user/sign_up
- post /user/sign_in
- post /user/sign_out

## Note:
- This projet disable any storage related to user(check devise.rb). This many cause unexpected break
