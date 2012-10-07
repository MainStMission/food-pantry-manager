# Contribution Guidelines

## Steps

1. Fork the repo via Github
2. git clone your fork
3. If you don't already have bundler installed, get it by running gem install
   bundler
4. Run bundle install to download all of the project's dependencies
5. Run rake setup
6. Make some changes
7. Tests the changes bundle exec rake
8. Submit a Pull Request on github (We would like to review the code)
9. Keep being AWESOME!

## Note

When running your local server, you'll want to ensure you use "foreman start"
to ensure you're running with the `.env` configuration.
