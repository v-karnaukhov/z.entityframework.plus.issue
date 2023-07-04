namespace IssueWithAnyAll.Entities;

public class VoteDocument : EntityTitleBase
{
    public virtual Vote Vote { get; set; }

    public int VoteId { get; set; }

    public virtual File File { get; set; }

    public int? FileId { get; set; }

    public int? TypeId { get; set; }
}