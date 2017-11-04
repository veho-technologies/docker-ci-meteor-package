FROM veho/ci-meteor:8.8.1

# create and setup a test app
RUN sudo mkdir -p /repos/package-to-test \
  && sudo chown -R `whoami` /repos \
  && cd /repos \
  && meteor create --bare test-app \
  && cd test-app \
  && meteor npm i \
  && mkdir -p packages \
  && ln -s /repos/package-to-test packages/package-to-test \
  && meteor add ecmascript meteortesting:mocha \
  && meteor remove mobile-experience

WORKDIR /repos/package-to-test
