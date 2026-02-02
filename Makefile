.PHONY: help install format format-check lint clean
.PHONY: tf-init tf-plan tf-apply tf-destroy tf-fmt tf-validate tf-output tf-clean
.DEFAULT_GOAL := help

# Colors for output
CYAN := \033[0;36m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

# Terraform directory
TF_DIR := terraform

#==============================================================================
# Help
#==============================================================================

help: ## Show this help message
	@echo '$(CYAN)Available targets:$(NC)'
	@echo ''
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  $(GREEN)%-20s$(NC) %s\n", $$1, $$2}' $(MAKEFILE_LIST)

#==============================================================================
# Project Setup & Maintenance
#==============================================================================

install: ## Install project dependencies
	npm install
	git lfs install

format: ## Format all files (Prettier + markdownlint)
	npm run format

format-check: ## Check formatting without changes
	npm run format:check

lint: ## Lint markdown files
	npm run lint:markdown

clean: ## Clean temporary files and caches
	rm -rf node_modules
	rm -rf tmp
	rm -rf .terraform
	rm -f .terraform.lock.hcl

#==============================================================================
# Terraform Commands
#==============================================================================

tf-init: ## Initialize Terraform
	@echo "$(CYAN)Initializing Terraform...$(NC)"
	cd $(TF_DIR) && terraform init

tf-plan: ## Show Terraform execution plan
	@echo "$(CYAN)Creating Terraform plan...$(NC)"
	cd $(TF_DIR) && terraform plan

tf-apply: ## Apply Terraform changes
	@echo "$(YELLOW)Applying Terraform changes...$(NC)"
	cd $(TF_DIR) && terraform apply

tf-apply-auto: ## Apply Terraform changes without confirmation
	@echo "$(YELLOW)Auto-applying Terraform changes...$(NC)"
	cd $(TF_DIR) && terraform apply -auto-approve

tf-destroy: ## Destroy Terraform-managed infrastructure
	@echo "$(RED)Destroying infrastructure...$(NC)"
	cd $(TF_DIR) && terraform destroy

tf-fmt: ## Format Terraform files
	@echo "$(CYAN)Formatting Terraform files...$(NC)"
	cd $(TF_DIR) && terraform fmt -recursive

tf-validate: ## Validate Terraform configuration
	@echo "$(CYAN)Validating Terraform configuration...$(NC)"
	cd $(TF_DIR) && terraform validate

tf-output: ## Show Terraform outputs
	cd $(TF_DIR) && terraform output

tf-clean: ## Clean Terraform cache and state backup
	@echo "$(CYAN)Cleaning Terraform cache...$(NC)"
	rm -rf $(TF_DIR)/.terraform
	rm -f $(TF_DIR)/.terraform.lock.hcl
	rm -f $(TF_DIR)/terraform.tfstate.backup

tf-refresh: ## Refresh Terraform state
	cd $(TF_DIR) && terraform refresh

tf-show: ## Show current Terraform state
	cd $(TF_DIR) && terraform show

#==============================================================================
# Combined Workflows
#==============================================================================

setup: install tf-init ## Complete project setup (install + terraform init)
	@echo "$(GREEN)Setup complete!$(NC)"

deploy: tf-fmt tf-validate tf-plan ## Prepare for deployment (format, validate, plan)
	@echo "$(GREEN)Ready to deploy. Run 'make tf-apply' to apply changes.$(NC)"

check: format-check lint tf-fmt tf-validate ## Run all checks (format, lint, terraform)
	@echo "$(GREEN)All checks passed!$(NC)"
