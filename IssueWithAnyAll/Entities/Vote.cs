namespace IssueWithAnyAll.Entities;

public class Vote : EntityBase
{
    public virtual MeetingRequest MeetingRequest { get; set; }

    public int MeetingRequestId { get; set; }

    public virtual VoteResult Result { get; set; }

    public int? ResultId { get; set; }

    public int? VotedById { get; set; }

    public string Comment { get; set; }

    public bool? Completed { get; set; }

    public bool IsAutoVote { get; set; }

    // для случая, когда пользователь вообще не голосовал
    public bool? AwaitingResult { get; set; }

    public virtual IList<VoteDocument> Documents { get; set; }
}