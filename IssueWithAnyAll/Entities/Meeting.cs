namespace IssueWithAnyAll.Entities;

public class Meeting : EntityTitleBase
{
    public virtual IList<MeetingRequest> Requests { get; set; }

    public int? MacroDivisionId { get; set; }

    public DateTimeOffset Date { get; set; }

    public DateTimeOffset? DateEnd { get; set; }

    public string LocationCustom { get; set; }

    public string Description { get; set; }


    public string CalendarAppointmentId { get; set; }

    /// <summary>
    /// Используется для импорта решений
    /// </summary>
    public Guid? InternalKey { get; set; }
}