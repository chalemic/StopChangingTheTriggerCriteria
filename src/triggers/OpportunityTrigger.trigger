trigger OpportunityTrigger on Opportunity (after insert, after update) 
{
  List<Opportunity> oppsNeedingContracts = new List<Opportunity>();

  for(Opportunity o : trigger.new)
  {
  	// Before - logic hard-coded into trigger
  	if(o.StageName == 'Closed Won')
  	// After - logic moved to formula field
    //if(o.Requires_Contract__c)
    {
      oppsNeedingContracts.add(o);
    }
  }

  ContractHelper.CreateContracts(oppsNeedingContracts);
}