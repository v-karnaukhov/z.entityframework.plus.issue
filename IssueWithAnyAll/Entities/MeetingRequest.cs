namespace IssueWithAnyAll.Entities;

public class MeetingRequest : EntityBase
{
    public virtual Meeting Meeting { get; set; }

    public int MeetingId { get; set; }

    public virtual Request Request { get; set; }

    public int? RequestId { get; set; }

    public int? Index { get; set; }

    public virtual IList<Vote> Votes { get; set; }

    /// <summary>
    /// Решение ТК
    /// </summary>
    public string Decision { get; set; }

    public DateTimeOffset? DueDate { get; set; }

    public DateTimeOffset? Date { get; set; }

    public bool? DueDatePermanently { get; set; }

    public bool? IsVoted { get; set; }

    public string SolutionFileHash { get; set; }

    /// <summary>
    /// используется для хранения текущего состояния workflow (БЕ технологии)
    /// </summary>
    public int? RequestExtraKey { get; set; }

    /// <summary>
    /// внешний номер для тех решений которые импротриуются из ТСХ,
    /// </summary>
    public int? ExternalId { get; set; }

    /// <summary>
    /// внешний номер для тех решений которые импротриуются из ТС5,
    /// </summary>
    public int? ExternalIdTc5 { get; set; }

    /// <summary>
    /// внешний номер для тех решений которые импротируются из ТК ПБ
    /// </summary>
    public int? ExternalIdTkpb { get; set; }

    /// <summary>
    /// внешний номер для тех решений которые импротируются из ТК ПБ
    /// </summary>
    public string ExternalIdBuTech { get; set; }
}