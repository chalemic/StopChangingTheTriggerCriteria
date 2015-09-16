public with sharing class ContractHelper 
{
  public static void CreateContracts(List<Opportunity> oppsNeedingContracts)
  {
    List<Contract> newContracts = new List<Contract>();

    for(Opportunity o : oppsNeedingContracts)
    {
      newContracts.add(new Contract(
                       AccountId = o.AccountId,
                       ContractTerm = (Integer)o.Contract_Duration__c,
                       From_Opportunity__c = o.Id,
                       StartDate = Date.today(),
                       Status = 'Draft'));
    }

    insert newContracts;
  }
}