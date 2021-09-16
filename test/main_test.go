package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
)

func TestTerraformCodeInfrastructureInitialCredentials(t *testing.T) {
	// Used to differentiate each run, in case a run leaves artifacts
	//stagePrefix := random.UniqueId() + "-"

	// Copy to temp folder to isolate the main module from the existing Terraform state (.terraform folder)
	terraformTempDir := test_structure.CopyTerraformFolderToTemp(t, "../terraform", "./")
	terraformOptions := &terraform.Options{
		TerraformDir: terraformTempDir,
		Vars: map[string]interface{}{},
	}

	// Uncomment this once there is actual resource creation
	//defer terraform.Destroy(t, terraformOptions)

	// Init Terraform - should always pass
	terraform.Init(t, terraformOptions)
}
