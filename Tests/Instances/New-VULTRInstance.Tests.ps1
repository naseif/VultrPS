Describe 'New-VULTRInstance' {

    BeforeAll {
        Remove-Module VultrPS*; Import-Module $PSScriptRoot/../../VultrPS
        Set-VULTRAPIKey (Get-Content apikey_for_tests.apikey)
    }

    it 'creates a simple new instance with the default parameters' {
        $instance = New-VULTRInstance
        $instance | Should -Not -BeNullOrEmpty

        $instance.default_password | Should -Not -BeNullOrEmpty
        $instance.ram | Should -Be 8192
        $instance.vcpu_count | Should -Be 4

        Remove-VULTRInstance $instance.id
    }   
}