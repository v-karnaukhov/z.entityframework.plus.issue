using IssueWithAnyAll.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IssueWithAnyAll.Configs;

public class MeetingRequestConfig : EntityConfig<MeetingRequest>
{
    public override void Configure(EntityTypeBuilder<MeetingRequest> builder)
    {
        base.Configure(builder);

        builder.HasOne(o => o.Meeting).WithMany(o => o.Requests).HasForeignKey(o => o.MeetingId);
        builder.HasOne(o => o.Request).WithMany(o => o.Meetings).HasForeignKey(o => o.RequestId);
    }
}