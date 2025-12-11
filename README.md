# Crystal Koans

Learn Crystal through test-driven exercises. Fix failing tests to achieve enlightenment.

Crystal Koans is an interactive learning tool inspired by [Ruby Koans](http://rubykoans.com/). Walk the path of the koans, fixing one failing test at a time, and gain hands-on proficiency in Crystal.

## Requirements

- Crystal 1.17.1 or higher ([Install Crystal](https://crystal-lang.org/install))

## Getting Started

```bash
# Clone the repository
git clone https://github.com/jkthorne/koans.git
cd koans

# Start your journey
crystal run src/path_to_enlightenment.cr
```

## Usage

### Progressive Mode (Recommended)

Run the koans in order, stopping at the first failure:

```bash
crystal run src/path_to_enlightenment.cr
```

The path will guide you through each koan. When a test fails:
1. Read the failure message
2. Open the indicated file
3. Replace `FILL_ME_IN` (or other placeholder) with the correct value
4. Run again and repeat

### Greedy Mode

Run all tests at once:

```bash
crystal spec spec/koans/
```

### Single Topic

Focus on a specific topic:

```bash
crystal spec spec/koans/01_about_asserts_spec.cr
```

### Reset Progress

Start fresh by clearing cached progress:

```bash
crystal run src/path_to_enlightenment.cr -- --reset
```

## Topics Covered

The koans cover 30 topics, progressing from basics to Crystal-specific features:

**Fundamentals**
- Asserts, Nil, Numbers, Strings, Symbols
- Arrays, Hashes, Control Statements
- True and False, Methods, Blocks
- Procs and Lambdas, Classes, Inheritance, Modules

**Intermediate**
- Scope, Self, Constants
- Method Visibility, Exceptions

**Crystal-Specific**
- Union Types, Type Inference
- Generics, Enums, Macros
- Concurrency (Fibers & Channels)
- Regular Expressions, Open Classes
- Structs, Tuples

## Placeholders

Replace these with the correct values:

- `__` - Generic placeholder (returns "FILL ME IN")
- `__n__` - Numeric placeholder (returns 999999999)
- `__f__` - Float placeholder (returns 999999999.999)
- `__bool__` - Boolean placeholder (returns false)
- `__char__` - Character placeholder
- `__array__` - Array placeholder
- `__hash__` - Hash placeholder

## Contributing

1. Fork it (<https://github.com/your-github-user/crystal-koans/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT License - see [LICENSE](LICENSE)

## Acknowledgments

Inspired by [Ruby Koans](http://rubykoans.com/) by EdgeCase.
