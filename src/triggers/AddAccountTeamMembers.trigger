trigger AddAccountTeamMembers on Account (after insert) 
{
  // Demo 1
  // Before - Hard-coding in trigger when to add members to an account team.
  // After - trigger is unused and Process Builder invokes AddAccountTeamAction.addTeamMembers instead
  List<Account> hospitalityAccounts = new List<Account>();
  for(Account a:trigger.new)
  {
    if(a.Industry == 'Hospitality')
    {
      hospitalityAccounts.add(a);
    }
  }

  AccountTeamHelper.addTeamMembers(hospitalityAccounts, Label.Account_Team_A);
}