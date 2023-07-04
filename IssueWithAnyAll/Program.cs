using IssueWithAnyAll;
using IssueWithAnyAll.Entities;
using Microsoft.EntityFrameworkCore;

try
{
    var votesIncludes = new[]
    {
        $"{nameof(Request.Meetings)}.{nameof(MeetingRequest.Votes)}.{nameof(Vote.Documents)}",
        $"{nameof(Request.Meetings)}.{nameof(MeetingRequest.Votes)}.{nameof(Vote.Documents)}.{nameof(VoteDocument.File)}",
    };

    var context =
        new DataContext(
            "Server=localhost;Database=exampledb02;User Id=tendercommittee;Password=tendercommittee;TrustServerCertificate=True;Application Name=Debuger");

    var temp = context.Requests
        .Where(x => x.Id == 1)
        .IncludeOptimizedMultiple(votesIncludes)
        .FirstOrDefault();

    var temp2 = context.Requests
        .Include(x => x.Meetings)
            .ThenInclude(x => x.Votes)
            .ThenInclude(x => x.Documents)
            .ThenInclude(x => x.File)
        .Where(x => x.Id == 1)
        .FirstOrDefault();

    Console.ReadKey();
}
catch (Exception e)
{

}
