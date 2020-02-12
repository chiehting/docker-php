.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## docker-compose up
	$(call docker-compose,up -d)

down: ## docker-compose down
	$(call docker-compose,down)

ps: ## docker-compose ps
	$(call docker-compose,ps)

logs: ## docker-compose logs
	$(call docker-compose,logs -f --tail 100)

.PHONY: du
du:
	@make down
	@make up

.PHONY: dul
dul:
	@make du
	@make logs

define docker-compose
    @docker-compose -f docker/docker-compose.yml -p web $1;
endef

