namespace IssueWithAnyAll.Entities;

public abstract class EntityTitleBase : EntityBase, IEntityTitle
{
    public string Title { get; set; }
}