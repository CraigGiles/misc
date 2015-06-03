#!/bin/sh
mkdir -p src/{main,test}/{java,resources,scala}
mkdir lib project target

# create an initial build.sbt file
echo 'name := "MyProject"

version := "1.0.0-SNAPSHOT"

scalaVersion := "2.11.6"

resolvers += "Local Ivy Repository" at Path.userHome.asFile.toURI.toURL + ".ivy2/local"

val coreDependencies = Seq(
  "org.joda" % "joda-convert" % "1.6",
  "joda-time" % "joda-time" % "2.4",
)

val databaseDependencies = Seq(
)

val configDependencies = Seq(
)

val loggingDependencies = Seq(
  "org.slf4j" % "slf4j-nop" % "1.6.4"
)

val testDependencies = Seq(
  "org.mockito" % "mockito-core" % "1.10.19" % "test",
  "org.scalatest" %% "scalatest" % "2.2.4" % "test"
)

libraryDependencies ++=
  coreDependencies ++
  configDependencies ++
  databaseDependencies ++
  loggingDependencies ++
  testDependencies


scalaSource in Test := baseDirectory.value / "src/test/scala"

scalaSource in Compile := baseDirectory.value / "src/main/scala"

resourceDirectory in Compile := baseDirectory.value / "src/main/resources"

resourceDirectory in Test := baseDirectory.value / "src/test/resources"
' > build.sbt
