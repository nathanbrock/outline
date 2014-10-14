#!/usr/bin/env roundup

describe "outline: Helper script to create empty files"

outline="./outline"
test_files="test_files"

before() {
	mkdir -p $test_files
}

after() {
	rm -fr $test_files
}

it_shows_help_with_no_argv() {
	$outline | grep "USAGE"
}

it_shows_help_with_invalid_input() {
	$outline 1000ABC | grep "USAGE"
}

it_creates_file_with_no_unit() {
	output="$test_files/1234_file.txt"
	$outline 1234 $output
	result=$(ls -la $test_files/1234_file.txt | awk '{ print $5 }')
	test $result = '1234'
}

it_creates_file_with_K_unit() {
	output="$test_files/1K_file.txt"
	$outline 1K $output
	result=$(ls -la $test_files/1K_file.txt | awk '{ print $5 }')
	test $result = '1000'
}

it_creates_file_with_M_unit() {
	output="$test_files/1M_file.txt"
	$outline 1M $output
	result=$(ls -la $test_files/1M_file.txt | awk '{ print $5 }')
	test $result = '1000000'
}

it_creates_file_with_decimal_unit() {
	output="$test_files/0.5M_file.txt"
	$outline 0.5M $output
	result=$(ls -la $test_files/0.5M_file.txt | awk '{ print $5 }')
	test $result = '500000'
}

it_creates_file_with_G_unit() {
	output="$test_files/0.5G_file.txt"
	$outline 0.5G $output
	result=$(ls -la $test_files/0.5G_file.txt | awk '{ print $5 }')
	test $result = '500000000'
}