# Longest Successful Mars Mission — Security Code Finder
# Analyzes space_missions.log to find the longest completed Mars mission
#
# Usage: awk -f mars_mission_analysis.sh space_missions.log
# Result: XRT-421-ZQP (1629 days)

awk -F'|' '
/^#/ { next }
{
  dest   = $3; gsub(/^[ \t]+|[ \t]+$/, "", dest)
  status = $4; gsub(/^[ \t]+|[ \t]+$/, "", status)
  dur    = $6; gsub(/^[ \t]+|[ \t]+$/, "", dur)
  code   = $8; gsub(/^[ \t]+|[ \t]+$/, "", code)

  if (dest == "Mars" && status == "Completed" && dur+0 > max) {
    max  = dur+0
    best = code
  }
}
END {
  print "Longest Mars mission duration:", max, "days"
  print "Security code:", best
}
' space_missions.log