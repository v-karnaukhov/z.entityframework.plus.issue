namespace IssueWithAnyAll.Entities;

public class Request : EntityBase
{
    public virtual RequestStatus Status { get; set; }

    public int? StatusId { get; set; }

    public virtual RequestType Type { get; set; }

    public int TypeId { get; set; }

    public virtual IList<MeetingRequest> Meetings { get; set; }
}
