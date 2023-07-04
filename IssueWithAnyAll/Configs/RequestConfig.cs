using IssueWithAnyAll.Entities;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IssueWithAnyAll.Configs;

public class RequestConfig : EntityConfig<Request>
{
    public override void Configure(EntityTypeBuilder<Request> builder)
    {
        base.Configure(builder);

        builder.HasOne(o => o.Type).WithMany().HasForeignKey(o => o.TypeId);
        builder.HasOne(o => o.Status).WithMany().HasForeignKey(o => o.StatusId);
    }
}
