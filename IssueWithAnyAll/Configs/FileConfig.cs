using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IssueWithAnyAll.Configs;

public class FileConfig : EntityConfig<IssueWithAnyAll.Entities.File>
{
    public override void Configure(EntityTypeBuilder<IssueWithAnyAll.Entities.File> builder)
    {
        base.Configure(builder);
    }
}