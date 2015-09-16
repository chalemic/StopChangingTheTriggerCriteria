/* 
	Class invoked by Process Builder
	See https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_annotation_InvocableMethod.htm 
	for more details on invocable methods.
*/
public with sharing class AddAccountTeamAction 
{
  @InvocableMethod(label='Add AccountTeam Members' 
                   description='Adds people from TeamA as AccountTeam members to the specified Accounts.')
  public static void addTeamMembers(List<Account> accounts) 
  {
    AccountTeamHelper.addTeamMembers(accounts, Label.Account_Team_A);
  }
}