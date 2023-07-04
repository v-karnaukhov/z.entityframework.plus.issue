using System.ComponentModel.DataAnnotations;

namespace IssueWithAnyAll.Entities;

public class RequestStatus : EntityBase
{
    public int Id { get; set; }

    [Timestamp]
    public byte[] RowVersion { get; set; }

    public bool? IsDeleted { get; set; }
}