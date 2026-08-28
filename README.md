# terraform_project

Complete terraform drift workflow ----
-----------------------------------------
              Terraform
                  │
                  ▼
          terraform state list
                  │
                  ▼
           Check AWS reality
                  │
                  ▼
          terraform plan
                  │
                  ▼
          Drift detected?
             /          \
           YES           NO
            │             │
            ▼             ▼
 terraform plan       No action
 -refresh-only
            │
            ▼
      Review the drift
            │
       ┌────┴────┐
       │         │
       ▼         ▼
  Unintentional  Intentional
     change        change
       │             │
       ▼             ▼
 Terraform        Update
 should restore   Terraform
 infrastructure  configuration
       │             │
       ▼             ▼
 terraform plan  terraform
                 apply
       │
       ▼
 terraform apply


 # 1. Check state
terraform state list

# 2. Check for drift
terraform plan -refresh-only

# 3. Update state to match AWS
terraform apply -refresh-only

# 4. Remove old/stale plan
rm ec2_infra.tfplan

# 5. Create fresh plan
terraform plan -out=ec2_infra.tfplan

# 6. Review plan
terraform show ec2_infra.tfplan

# 7. Apply
terraform apply ec2_infra.tfplan
