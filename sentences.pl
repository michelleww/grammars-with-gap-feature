% as described in this post: https://bb-2019-09.teach.cs.toronto.edu/t/a3-test-sentences-for-q2-as-well/1170 
% this file contains test sentences for both Q1 and Q2.

% Q1 Test cases: Note that Q1a and Q1b share the same test cases as the functionality of grammars should be the same.
% positive

test_sent([fido, feeds, fido]).

test_sent([the, puppies, feed, fido]).

test_sent([fido, feeds, puppies, with, biscuits]).

test_sent([the, biscuits, with, fido, feed, puppies]).

test_sent([the, biscuits, with, fido, feed, the, biscuits]).

test_sent([fido, feeds, the, dog]).

test_sent([fido, feeds, the, dog, with, puppies]).

test_sent([the, dog, feeds, fido]).

test_sent([puppies, feed, fido]).

test_sent([puppies, feed, the, dog]).

% negative

test_sent([the, dog, feeds, fido, with, the, puppies], fails).

test_sent([the, dog, feed, fido], fails).

test_sent([the, biscuits, feeds, the, puppies], fails).

test_sent([the, dog, feeds, fido, with, the, puppies], fails).

test_sent([the, dog, feed, fido, with, the, biscuits, with, fido], fails).

test_sent([the, puppies, feeds, fido], fails).

test_sent([dog, feeds, fido], fails).

test_sent([dogs, feeds, the, puppies], fails).

test_sent([the, fido, feeds, the, puppies], fails).

test_sent([fido, with, biscuits, feeds, fido, puppies], fails).


% Q2 Test cases
% positive

test_sent([the, student, tried, to, sleep]).

test_sent([the, student, tried, to, promise]).

test_sent([the, student, tried, to, try, to, try, to, sleep]).

test_sent([the, student, tried, to, try, to, try, to, try, to, sleep]).

test_sent([the, student, tried, to, appear, to, sleep]).

test_sent([the, student, tried, to, appear, to, expect, the, teacher, to, sleep]).

test_sent([the, student, tried, to, appear, to, expect, the, teacher, to, try, to, sleep]).

test_sent([the, student, tried, to, promise, the, teacher, to, sleep]).

test_sent([the, student, tried, to, promise, the, teacher, to, try, to, sleep]).

test_sent([the, student, tried, to, promise, the, teacher, to, expect, the, student, to, sleep]).

test_sent([the, student, expected, the, teacher, to, sleep]).

test_sent([the, student, expected, the, teacher, to, try, to, sleep]).

test_sent([the, student, expected, the, teacher, to, try, to, try, to, sleep]).

test_sent([the, student, expected, the, teacher, to, try, to, appear, to, sleep]).

test_sent([the, student, promised, the, teacher, to, sleep]).

test_sent([the, student, promised, the, teacher, to, try, to, sleep]).

test_sent([the, student, promised, the, teacher, to, try, to, try, to, sleep]).

test_sent([the, student, promised, the, teacher, to, try, to, expect, the, student, to, sleep]).

test_sent([the, student, promised, the, teacher, to, try, to, expect, the, student, to, appear, to, sleep]).

test_sent([the, student, promised, the, teacher, to, try, to, expect, the, student, to, try, to, appear, to, sleep]).

test_sent([the, student, promised, the, teacher, to, try, to, expect, the, teacher, to, try, to, appear, to, sleep]).

test_sent([the, student, appeared, to, sleep]).

test_sent([the, student, appeared, to, try, to, sleep]).

test_sent([the, student, appeared, to, try, to, expect, the, teacher, to, sleep]).

test_sent([the, student, tried, to, promise, the, teacher, to, try, to, expect, the, student, to, appear, to, sleep]).

% negative

test_sent([the, student, expect], fails).

test_sent([the, student, expected], fails).

test_sent([the, student, expect, to, sleep], fails).

test_sent([the, student, expected, to, sleep], fails).

test_sent([the, student, promise], fails).

test_sent([the, student, promised], fails).

test_sent([the, student, promised, to, sleep], fails).

test_sent([the, student, promise, to, sleep], fails).

test_sent([the, student, tried], fails).

test_sent([the, student, tried, the, teacher, to, sleep], fails).

test_sent([the, student, promised], fails).

test_sent([the, student, promised, to, sleep], fails).

test_sent([the, student, promise, to, sleep], fails).

test_sent([the, student, tried, to, slept], fails).

test_sent([the, student, appeared, the, teacher, to, sleep], fails).

test_sent([the, student, tried, to, tried, to, sleep], fails).

test_sent([the, student, tried, to, tried, to, promise], fails).

test_sent([the, student, tried, to, tried, to, expect], fails).

test_sent([the, student, tried, to, promise, to, sleep], fails).

test_sent([the, student, tried, to, promise, sleep], fails).

test_sent([the, student, tried, to, promise, the, teacher], fails).

test_sent([the, student, expected, the, teacher, to, try, to, slept], fails).

test_sent([the, student, promised, the, teacher, to, try, to, expect, to, sleep], fails).

test_sent([the, student, promised, the, teacher, to, try, to, expect, the, student, to, appear, to], fails).

test_sent([the, student, appeared, the, teacher, to, sleep], fails).

test_sent([the, student, tried, to, tried, to, sleep], fails).

test_sent([the, student, tried, to, promise, to, sleep], fails).

test_sent([the, student, tried, to, promise, sleep], fails).

test_sent([the, student, tried, to, promise, the, teacher], fails).

test_sent([the, student, expected, the, teacher, to, try, to, slept], fails).

test_sent([the, student, promised, the, teacher, to, try, to, expect, to, sleep], fails).

test_sent([the, student, promised, the, teacher, to, try, to, expect, the, student, to, appear, to], fails).
