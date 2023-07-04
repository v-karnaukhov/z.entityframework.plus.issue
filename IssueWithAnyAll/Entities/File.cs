namespace IssueWithAnyAll.Entities;

public enum FileSource : byte
{
    Database = 0,
    Cmis = 1
}

public class File : EntityBase
{
    public string Name { get; set; }

    public string Type { get; set; }

    public long Size { get; set; }

    public string Hash { get; set; }

    public FileSource Source { get; set; }
}