Class dc.aoc2021.base
{

/// get os compliant access
ClassMethod aocdir(filename = "") As %String
{
  set md=$system.Util.ManagerDirectory()
  set re=md_"aoc"_$e(md,*)_filename
  quit re
}

}
