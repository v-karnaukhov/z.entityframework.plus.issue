using IssueWithAnyAll.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace IssueWithAnyAll.Configs;

public class EntityConfig<TEntity> : IEntityTypeConfiguration<TEntity> where TEntity : EntityBase
{
    public virtual void Configure(EntityTypeBuilder<TEntity> builder)
    {
        builder.Property(e => e.Id).ValueGeneratedOnAdd();
    }
}