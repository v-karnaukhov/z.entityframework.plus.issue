using IssueWithAnyAll.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IssueWithAnyAll.Configs;

public class VoteConfig : EntityConfig<Vote>
{
    public override void Configure(EntityTypeBuilder<Vote> builder)
    {
        base.Configure(builder);

        builder.HasOne(o => o.MeetingRequest).WithMany(o => o.Votes).HasForeignKey(o => o.MeetingRequestId);
        builder.HasOne(o => o.Result).WithMany().HasForeignKey(o => o.ResultId);
        builder.HasMany(o => o.Documents).WithOne(o => o.Vote).HasForeignKey(o => o.VoteId);
    }
}