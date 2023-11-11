﻿// <auto-generated />
using System;
using E_Journal.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace E_Journal.Infrastructure.Migrations
{
    [DbContext(typeof(DBContext))]
    [Migration("20231111100417_initDB")]
    partial class initDB
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.13")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("E_Journal.Domain.Model.Attend", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid?>("LessonId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("MarkId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("StudentId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("LessonId");

                    b.HasIndex("MarkId");

                    b.HasIndex("StudentId");

                    b.ToTable("Attends");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.AttestationType", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("AttestationTypes");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.EducationalForm", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("EducationalForms");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Group", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid>("EducationalFormId")
                        .HasColumnType("uuid");

                    b.Property<string>("Number")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<Guid>("SpecializationId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("EducationalFormId");

                    b.HasIndex("SpecializationId");

                    b.ToTable("Groups");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Lesson", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateOnly>("Date")
                        .HasColumnType("date");

                    b.Property<Guid>("ScheduleId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("TeachingId")
                        .HasColumnType("uuid");

                    b.Property<string>("Topic")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("ScheduleId");

                    b.HasIndex("TeachingId");

                    b.ToTable("Lessons");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.LessonForm", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<int>("Hours")
                        .HasColumnType("integer");

                    b.Property<Guid>("LessonTypeId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("TeacherId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("LessonTypeId");

                    b.HasIndex("TeacherId");

                    b.ToTable("LessonForms");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.LessonType", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("LessonTypes");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Mark", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<char>("Code")
                        .HasColumnType("character(1)");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Marks");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Schedule", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<TimeOnly>("EndTime")
                        .HasColumnType("time without time zone");

                    b.Property<int>("Number")
                        .HasColumnType("integer");

                    b.Property<TimeOnly>("StartTime")
                        .HasColumnType("time without time zone");

                    b.HasKey("Id");

                    b.ToTable("Schedules");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Specialization", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Code")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Specializations");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Student", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateOnly>("BirthDate")
                        .HasColumnType("date");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<Guid?>("GroupId")
                        .HasColumnType("uuid");

                    b.Property<int?>("IdCard")
                        .HasColumnType("integer");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Patronymic")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("GroupId");

                    b.ToTable("Students");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Subject", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Subjects");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Teacher", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Patronymic")
                        .HasColumnType("text");

                    b.Property<string>("Post")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Teachers");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Teaching", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<Guid>("AttestationTypeId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("GroupId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("LessonFormId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("LessonTypeId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("SubjectId")
                        .HasColumnType("uuid");

                    b.Property<int>("Term")
                        .HasColumnType("integer");

                    b.Property<bool>("TermProject")
                        .HasColumnType("boolean");

                    b.HasKey("Id");

                    b.HasIndex("AttestationTypeId");

                    b.HasIndex("GroupId");

                    b.HasIndex("LessonFormId");

                    b.HasIndex("LessonTypeId");

                    b.HasIndex("SubjectId");

                    b.ToTable("Teachings");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Attend", b =>
                {
                    b.HasOne("E_Journal.Domain.Model.Lesson", null)
                        .WithMany("Attendance")
                        .HasForeignKey("LessonId");

                    b.HasOne("E_Journal.Domain.Model.Mark", "Mark")
                        .WithMany()
                        .HasForeignKey("MarkId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Mark");

                    b.Navigation("Student");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Group", b =>
                {
                    b.HasOne("E_Journal.Domain.Model.EducationalForm", "EducationalForm")
                        .WithMany()
                        .HasForeignKey("EducationalFormId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.Specialization", "Specialization")
                        .WithMany()
                        .HasForeignKey("SpecializationId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("EducationalForm");

                    b.Navigation("Specialization");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Lesson", b =>
                {
                    b.HasOne("E_Journal.Domain.Model.Schedule", "Schedule")
                        .WithMany()
                        .HasForeignKey("ScheduleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.Teaching", "Teaching")
                        .WithMany()
                        .HasForeignKey("TeachingId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Schedule");

                    b.Navigation("Teaching");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.LessonForm", b =>
                {
                    b.HasOne("E_Journal.Domain.Model.LessonType", "LessonType")
                        .WithMany()
                        .HasForeignKey("LessonTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.Teacher", "Teacher")
                        .WithMany()
                        .HasForeignKey("TeacherId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("LessonType");

                    b.Navigation("Teacher");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Student", b =>
                {
                    b.HasOne("E_Journal.Domain.Model.Group", "Group")
                        .WithMany()
                        .HasForeignKey("GroupId");

                    b.Navigation("Group");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Teaching", b =>
                {
                    b.HasOne("E_Journal.Domain.Model.AttestationType", "AttestationType")
                        .WithMany()
                        .HasForeignKey("AttestationTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.Group", "Group")
                        .WithMany()
                        .HasForeignKey("GroupId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.LessonForm", "LessonForm")
                        .WithMany()
                        .HasForeignKey("LessonFormId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.LessonType", "LessonType")
                        .WithMany()
                        .HasForeignKey("LessonTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("E_Journal.Domain.Model.Subject", "Subject")
                        .WithMany()
                        .HasForeignKey("SubjectId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("AttestationType");

                    b.Navigation("Group");

                    b.Navigation("LessonForm");

                    b.Navigation("LessonType");

                    b.Navigation("Subject");
                });

            modelBuilder.Entity("E_Journal.Domain.Model.Lesson", b =>
                {
                    b.Navigation("Attendance");
                });
#pragma warning restore 612, 618
        }
    }
}
