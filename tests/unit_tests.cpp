#include <gtest/gtest.h>
#include "../math_operations.h"

TEST(MathOperations, BasicAddition) {
    EXPECT_EQ(add(2, 2), 4);
}