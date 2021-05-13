Describe 'APIKeyManagement' {

    BeforeAll {
        Remove-Module VultrPS*; Import-Module $PSScriptRoot/../../VultrPS
        Remove-VULTRAPIKey
    }

    Context 'without a key Get-VULTRAPIKey' {
        it 'throws an exception' {
            { Get-VULTRAPIKey } | Should -Throw "*You don't have an API key stored yet*"
        }   
    }

    Context 'after setting an API key GET-VULTRAPIKey' {
        it 'retrieves the set api key' {
            Set-VULTRAPIKey -APIKey "TestKey123"
            Get-VULTRAPIKey | Should -Be "TestKey123"
        }   
    }

    Context 'after removing an API Key GET-VULTRAPIKey' {
        it 'throws an exception again' {
            Remove-VULTRAPIKey
            { Get-VULTRAPIKey } | Should -Throw "*You don't have an API key stored yet*"
        }
    }
}