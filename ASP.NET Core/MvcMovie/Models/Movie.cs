using Microsoft.Extensions.Localization;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MvcMovie.Models
{
    public class Movie
    {

        public int Id { get; set; }
        [StringLength(60, MinimumLength = 3, ErrorMessage = "The field {0} must be a string with a minimum length of {1} and a maximum length of {2}.")]
        [Required(ErrorMessage = "The {0} field is required.")]
        [Display(Name = "Title")]
        public string Title { get; set; }
        [Display(Name = "Release Date")]
        [DataType(DataType.Date)]
        public DateTime ReleaseDate { get; set; }
        [RegularExpression(@"^[A-Z]+[a-zA-Z""'\s-]*$")]
        [Required(ErrorMessage = "The {0} field is required.")]
        [StringLength(30)]
        [Display(Name = "Genre")]
        public string Genre { get; set; }
        [Range(1, 100, ErrorMessage = "The field {0} must be between {1} and {2}.")]
        [DataType(DataType.Currency, ErrorMessage = "The field {0} must be a number.")]
        [Column(TypeName = "decimal(18, 2)")]
        [Required(ErrorMessage = "The {0} field is required.")]
        [Display(Name = "Price")]
        public decimal Price { get; set; }
        [RegularExpression(@"^[A-Z]+[a-zA-Z0-9""'\s-]*$", ErrorMessage = "The field {0} must match the regular expression {1}.")]
        [StringLength(5)]
        [Required(ErrorMessage = "The {0} field is required.")]
        [Display(Name = "Rating")]
        public string Rating { get; set; }

    }
}
