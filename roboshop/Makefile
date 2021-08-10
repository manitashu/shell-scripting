help:      ## Print this message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$//' | sed -e 's/##//'
frontend:  ## Install Frontend component
	@sh frontend.sh
catalogue: ## Install Catalogue component
	@sh catalogue.sh
cart:      ## Install Cart component
	@sh cart.sh
user:      ## Install User component
	@sh user.sh
shipping:  ## Install Shipping component
	@sh shipping.sh
payment:   ## Install Payment component
	@sh payment.sh
mongodb:   ## Install MongoDB component
	@sh mongodb.sh
redis:     ## Install Redis component
	@sh redis.sh
mysql:     ## Install MySQL component
	@sh mysql.sh
rabbitmq:  ## Install RabbitMQ component
	@sh rabbitmq.sh
databases: ## Install all databases
databases: mongodb redis rabbitmq mysql






