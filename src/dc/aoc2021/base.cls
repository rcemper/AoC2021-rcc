Class dc.aoc2021.base
{
// for d=0:1:11 do $classmethod("dc.aoc2021.Day"_d,"Run",0,0) r !,y:1
/// get os compliant access
ClassMethod aocdir(filename = "") As %String
{
  set md=$system.Util.ManagerDirectory()
  set re=md_"aoc"_$e(md,*)_filename
  quit re
}

}
