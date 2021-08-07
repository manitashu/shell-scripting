help: ## Print this message
    @fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$//' | sed -e 's/##//'
frontend:  ## Install Frontend component
    @bash Installing Frontend
catalogue: ## Install Catalogue component
    @bash Installing Catalogue
cart:      ## Install Cart component
    @bash Installing Cart
user:      ## Install User component
    @bash Installing User
shipping:  ## Install Shipping component
    @bash Installing Shipping
payment:   ## Install Payment component
    @bash Installing Payment
mongodb:   ## Install MongoDB component
    @bash Installing MongoDB
redis:     ## Install Redis component
    @bash Installing Redis
mysql:     ## Install MySQL component
    @bash Installing MySQL
rabbitmq:  ## Install RabbitMQ component
    @bash Installing RabbitMQ
databases: mongodb redis rabbitmq mysql  ## Install all databases
