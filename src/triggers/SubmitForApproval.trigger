trigger SubmitForApproval on Time_Log__c (after insert) {
  for(Time_Log__c tl : Trigger.new)
  if(tl.Status__c == 'Submitted')
  {
    Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
    req.setComments('New time log submitted for approval. Please approve.');
    req.setObjectId(tl.Id);
    // Before - using hard-coded user id
	req.setNextApproverIds(new Id[] {'00537000000hmmV'}); 
    // After switching to formula field
    // req.setNextApproverIds(new Id[] {tl.Approver__c}); 
    Approval.ProcessResult result = Approval.process(req);        
  }
}