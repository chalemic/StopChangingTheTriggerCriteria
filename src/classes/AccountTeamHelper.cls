public with sharing class AccountTeamHelper 
{
  public static void addTeamMembers(List<Account> accounts, Id groupId) 
  {
    List<AccountTeamMember> newTeamMembers = new List<AccountTeamMember>();
    List<GroupMember> teamA = [SELECT Id, UserOrGroupId FROM GroupMember WHERE GroupId =: groupId];

    for(Account a:accounts)
    {
      for(GroupMember gm:teamA)
      {
        newTeamMembers.add(new AccountTeamMember(AccountId = a.Id,
                                                  TeamMemberRole = 'Sales Rep',
                                                  UserId = gm.UserOrGroupId));   
      }
    }

    insert newTeamMembers;
  }
}