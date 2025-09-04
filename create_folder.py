import os

def create_infra_structure():
    """
    Creates the infrastructure folder structure with Terraform files
    """
    # Define the folder structure
   
    terraform_path = "C:/Users/hp/Documents/devopsprojects/taskapp/ansible"
    
    # Create directories
    os.makedirs(terraform_path, exist_ok=True)
    print(f"Created directory: {terraform_path}")
    
    # Define the Terraform files to create
    terraform_files = [
 "inventory.ini",
 "group_vars/all.yml",
 "db.yml",
 "app.yml",
 "files/taskapp-start.sh"
    ]
    
    # Create each Terraform file
    for file_name in terraform_files:
        file_path = os.path.join(terraform_path, file_name)
        with open(file_path, 'w') as f:
            # Add a basic comment to each file
            f.write(f"# {file_name.replace('.tf', '').title()} configuration\n")
            f.write(f"# TODO: Add your {file_name.replace('.tf', '')} configuration here\n")
        
        print(f"Created file: {file_path}")
    
    print("\nFolder structure created successfully!")
    print("\nStructure:")
    print("infra/")
    print("  terraform/")
    for file_name in terraform_files:
        print(f"    {file_name}")

if __name__ == "__main__":
    create_infra_structure()