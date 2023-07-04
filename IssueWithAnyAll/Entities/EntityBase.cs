using System.ComponentModel.DataAnnotations;

namespace IssueWithAnyAll.Entities;

public abstract class EntityBase
{
    public int Id { get; set; }

    [Timestamp]
    public byte[] RowVersion { get; set; }

    public bool? IsDeleted { get; set; }
}