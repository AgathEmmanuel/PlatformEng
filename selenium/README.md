

----------- Types of Tests

- Unit Tests
- Integration Tests
- Component Tests
- Functonal Tests
- UI Tests
- Prototype Test
- Exploratory Test
- Usability Test
- A/B Test
- Performance Test
- Security Test
- Reliability Test
- etc


-- unit
a single function is tested
run in seconds

-- integration
test multiple services
range in tens of seconds
create their own data

-- UI
end to end user workflow is tested
takes so much time


Test Automation is the Key


Agile Testing 

- Business facing
- Technology facing
- Critque product
- Guide development



--------- Selenium and Webdriver

- Selenium Remote Control (RC)
- Inject JavaScript (JS) into a browser to control and drive interactions
- Webdriver and Selenium Merged
- Selenium RC lost support and Web driver APIs are used by customers
- Webdrive W3C specification based on the Open Source WebDriver for automation
- The drivers are maintained by Browser Vendors



Working

- emulate the users action in automated testing

Selenium WebDriver works using client server communication.

Selenium test is executed
new session of the browser driver is created
browser is launched
for each command in the test script 
request is sent to the WebDriver API
it interprets the request and the step is then executed in the browser driver
the Browser Driver acts as the server and waits for request to come in
once each step is complete, the response is sent back to the WebDriver API and then back to the test
this continues until all steps are complete

ChromeDriver
GeckoDriver
EdgeDriver
SafariDriver

------------- Selenium Grid

- proxy server to run test remotely against browser instances
- distributes tests across servers
- tests on different browers, platforms and devices

Components of Grid

-- Hub
Central server for the grid
This is where tests are executed
There can be one hub in a grid instance
-- Node
Nodes are registered to a hub
This is where tests are run
It can be any platform
Many nodes can be registered to one hub
Hub searches for a mathing node to send test scripts


-- pros
distributes test on several machines
test can be run in parallel

-- cons
test running degrade in performance over time
to debug easily, setup warnings,logs and scripts for common behavious(like starting and stoping hub and nodes)
kill broser explicitly after tests
restart nodes periodically
restart server



---------------- Testing scripts Desgin patterns

readable tests
reusable codes
make use of variables
make use of functions
page object pattern [class for each page in app with its selectors and methods]
each test class must have one focus

